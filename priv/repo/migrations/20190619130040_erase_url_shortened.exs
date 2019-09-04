defmodule QrManager.Repo.Migrations.EraseUrlShortened do
  use Ecto.Migration

  def change do
    alter table(:urls) do
      remove(:url_shortened)
    end
  end
end
