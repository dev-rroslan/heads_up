# HeadsUp

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

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

