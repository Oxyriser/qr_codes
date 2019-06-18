defmodule QrManager.URLManager.URL do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :url, :string
    field :url_shortened, :string

    belongs_to :user, QrManager.UserManager.User

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url, :url_shortened, :user_id])
    |> validate_required([:url, :url_shortened, :user_id])
  end
end
