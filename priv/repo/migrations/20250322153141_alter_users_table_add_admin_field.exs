defmodule HeadsUp.Repo.Migrations.AlterUsersTableAddAdminField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :admin, :boolean, default: false
    end
  end
end
