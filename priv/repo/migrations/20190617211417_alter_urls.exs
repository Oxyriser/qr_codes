defmodule QrManager.Repo.Migrations.AlterUrls do
  use Ecto.Migration

  def change do
    alter table(:urls) do
      add :user_id, :integer
    end
  end
end
