defmodule QrManager.Repo.Migrations.CompleteUrls do
  use Ecto.Migration

  def change do
    alter table("urls") do
      add :name, :string
      add :number_of_access, :integer
      add :representation, :binary
    end
  end
end
