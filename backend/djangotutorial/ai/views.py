import json
import urllib.request
import urllib.error

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods

LM_STUDIO_URL = "http://localhost:1234/v1/chat/completions"


@csrf_exempt
@require_http_methods(["POST"])
def chat(request):
    """
    POST /ai/chat/

    Simple body:
      { "message": "Hello" }

    Or OpenAI-style body (same as LM Studio):
      {
        "messages": [
          {"role": "user", "content": "Hello"}
        ]
      }

    Optional:
      "model", "system_prompt", "temperature", "max_tokens"
    """
    try:
        body = json.loads(request.body)
    except (json.JSONDecodeError, ValueError):
        return JsonResponse({"error": "Invalid JSON body."}, status=400)

    if "messages" in body:
        messages = body["messages"]
    else:
        user_message = body.get("message", "").strip()
        if not user_message:
            return JsonResponse(
                {"error": "'message' or 'messages' is required."},
                status=400,
            )

        messages = []
        system_prompt = body.get("system_prompt")
        if system_prompt:
            messages.append({"role": "system", "content": system_prompt})
        messages.append({"role": "user", "content": user_message})

    payload = {"messages": messages}

    if "model" in body:
        payload["model"] = body["model"]
    if "temperature" in body:
        payload["temperature"] = float(body["temperature"])
    if "max_tokens" in body:
        payload["max_tokens"] = int(body["max_tokens"])

    req = urllib.request.Request(
        LM_STUDIO_URL,
        data=json.dumps(payload).encode("utf-8"),
        headers={"Content-Type": "application/json"},
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=120) as resp:
            lm_data = json.loads(resp.read().decode("utf-8"))
    except urllib.error.HTTPError as exc:
        error_body = exc.read().decode("utf-8")
        try:
            error_data = json.loads(error_body)
            message = error_data.get("error", {}).get("message", error_body)
        except json.JSONDecodeError:
            message = error_body or exc.reason
        return JsonResponse({"error": message}, status=502)
    except urllib.error.URLError as exc:
        return JsonResponse(
            {"error": f"Could not reach LM Studio: {exc.reason}"},
            status=502,
        )

    reply = lm_data["choices"][0]["message"]["content"]

    return JsonResponse({
        "reply": reply,
        "model": lm_data.get("model"),
        "usage": lm_data.get("usage", {}),
    })
