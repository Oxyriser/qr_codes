defmodule QrManager.URLManagerTest do
  use QrManager.DataCase

  alias QrManager.URLManager

  describe "urls" do
    alias QrManager.URLManager.URL

    @valid_attrs %{url: "some url", url_shortened: "some url_shortened"}
    @update_attrs %{url: "some updated url", url_shortened: "some updated url_shortened"}
    @invalid_attrs %{url: nil, url_shortened: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> URLManager.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert URLManager.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert URLManager.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %URL{} = url} = URLManager.create_url(@valid_attrs)
      assert url.url == "some url"
      assert url.url_shortened == "some url_shortened"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = URLManager.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, %URL{} = url} = URLManager.update_url(url, @update_attrs)
      assert url.url == "some updated url"
      assert url.url_shortened == "some updated url_shortened"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = URLManager.update_url(url, @invalid_attrs)
      assert url == URLManager.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %URL{}} = URLManager.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> URLManager.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = URLManager.change_url(url)
    end
  end
end
