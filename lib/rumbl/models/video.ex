defmodule Rumbl.Models.Video do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Models.Video

  @required_fields [:url, :title, :description]
  @optional_fields [:category_id]

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :user, Rumbl.User
    belongs_to :category, Rumbl.Models.Category

    timestamps()
  end

  @doc false
  def changeset(%Video{} = video, attrs) do
    video
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:url, :title, :description])
  end
end
