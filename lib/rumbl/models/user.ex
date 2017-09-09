defmodule Rumbl.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(model, attrs \\ %{}) do
    model
    |> cast(attrs, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
    |> validate_length(:username, min: 1,  max: 20)
  end
end
