defmodule Barbr.User do
  use Barbr.Web, :model

  schema "users" do
    field :email, :string
    field :username, :string
    field :password_hash, :string

    # Virtual fields for password confirmation
    field :password, virtual: true, :string
    field :password_confirmation, virtual: true, :string
    timestamps
  end

  @required_fields ~w(email username password password_confirmation)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> hash_password
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset
  defp hash_password(%{valid?: true} = changeset) do
    hashedpw = Comeonin.BCrypt.hashpwsalt(Ecto.Changeset.get_field(changeset,
    :password))
    Ecto.Changeset.put_change(changeset, :password_hash, hashedpw)
  end
end
