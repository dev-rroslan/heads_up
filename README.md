# HeadsUp

Nginx reverse proxy
sudo nano /etc/nginx/sites-available/reverse-proxy

server {
    server_name applikasi.tech www.applikasi.tech;

    # Proxy all other requests to Phoenix app
    location / {
        proxy_http_version 1.1;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://localhost:4001;
    }
}

## Learn more

  * To find beam process: ps aux | grep beam.smp. PID after user in this case ubuntu XXXXXX
  * Kill the process: kill -15 <PID>
  * sudo nano /etc/systemd/system/heads_up.service
  [Unit]
Description=Heads Up Phoenix Application
After=network.target

[Service]
Type=simple
User=ubuntu
Group=ubuntu
WorkingDirectory=/home/ubuntu/heads_up/_build/prod/rel/heads_up
Environment="PORT=4001" "MIX_ENV=prod" "SECRET_KEY_BASE=kZxQQ/6vhGoxxxxx "DATABASE_URL=ecto://USER:PASSWORD@localhost/heads_up" "RESEND=XXXXXXXXXX"
ExecStart=/home/ubuntu/heads_up/_build/prod/rel/heads_up/bin/heads_up start
Restart=on-failure
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target

  * # Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile

# Compile assets
MIX_ENV=prod mix assets.deploy

# Create new release
MIX_ENV=prod mix release

# Restart heads_up
sudo systemctl restart heads_up

# Custom tasks (like DB migrations)
MIX_ENV=prod mix ecto.migrate

# Disable registration
In user_registration_live, comment out the code and replaced with:
{:noreply,
   socket
   |> put_flash(:error, "Registration is temporarily disabled.")}

also change user_params to _user_params






