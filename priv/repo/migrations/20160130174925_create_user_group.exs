defmodule Fishbowl.Repo.Migrations.CreateUserGroup do
  use Ecto.Migration

  def change do
    create table(:user_groups) do
      add :user_id, references(:users)
      add :group_id, references(:groups)

      timestamps
    end
  end
end
