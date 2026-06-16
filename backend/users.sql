-- Insert sample data into users table

INSERT INTO public.users (auth_id, email, full_name, role, account_status, email_verified, last_login)
VALUES
  ('auth0|001', 'alice@example.com',   'Alice Johnson',  'admin', 'active',   TRUE,  NOW()),
  ('auth0|002', 'bob@example.com',     'Bob Smith',      'user',  'active',   TRUE,  NOW()),
  ('auth0|003', 'charlie@example.com', 'Charlie Brown',  'user',  'inactive', FALSE, NULL),
  ('auth0|004', 'diana@example.com',   'Diana Prince',   'user',  'active',   TRUE,  NOW()),
  ('auth0|005', 'evan@example.com',    'Evan Rogers',    'user',  'active',   FALSE, NULL);
image.png