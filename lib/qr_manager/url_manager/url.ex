defmodule QrManager.URLManager.URL do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "urls" do
    field :url, :string
    field :name, :string
    field :number_of_access, :integer, default: 0
    field :representation, :binary

    belongs_to :user, QrManager.UserManager.User

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:url, :user_id])
    |> validate_required([:url, :user_id])
  end
end
