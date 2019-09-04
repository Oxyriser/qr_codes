defmodule QrManager.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string
      add :url_shortened, :string

      timestamps()
    end
  end
end
