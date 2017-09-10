defmodule Rumbl.ModelsTest do
  use Rumbl.DataCase

  alias Rumbl.Models

  describe "videos" do
    alias Rumbl.Models.Video

    @valid_attrs %{description: "some description", title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Models.create_video()

      video
    end

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Models.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Models.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Models.create_video(@valid_attrs)
      assert video.description == "some description"
      assert video.title == "some title"
      assert video.url == "some url"
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Models.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, video} = Models.update_video(video, @update_attrs)
      assert %Video{} = video
      assert video.description == "some updated description"
      assert video.title == "some updated title"
      assert video.url == "some updated url"
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Models.update_video(video, @invalid_attrs)
      assert video == Models.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Models.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Models.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Models.change_video(video)
    end
  end

  describe "categories" do
    alias Rumbl.Models.Category

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Models.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Models.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Models.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Models.create_category(@valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Models.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = Models.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Models.update_category(category, @invalid_attrs)
      assert category == Models.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Models.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Models.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Models.change_category(category)
    end
  end
end
