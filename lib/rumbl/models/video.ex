defmodule Rumbl.Models.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Models.Video

  @required_fields [:url, :title, :description]
  @optional_fields []

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    # field :user_id, :id
    belongs_to :user, Rumbl.User

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:url, :title, :description])
  end
end
