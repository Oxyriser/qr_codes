defmodule QrManager.Repo.Migrations.UpdateUserForAuthent do
  use Ecto.Migration

  def change do
    rename table(:users), :login, to: :first_name

    alter table(:users) do
      add :last_name, :string
      add :email, :string
      add :provider, :string
      add :token, :string
    end
  end
end
