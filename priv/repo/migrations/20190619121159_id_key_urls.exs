defmodule QrManager.Repo.Migrations.IdKeyUrls do
  use Ecto.Migration

  def change do
    alter table(:urls) do
      remove(:new_primary_id)
      add(:id, :uuid, primary_key: true)
    end
  end
end
