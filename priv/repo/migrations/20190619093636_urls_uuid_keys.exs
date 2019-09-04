defmodule QrManager.Repo.Migrations.UrlsUuidKeys do
  use Ecto.Migration

  def change do
    alter table(:urls) do
      remove(:id)
      add(:new_primary_id, :uuid, primary_key: false)
    end
  end
end
