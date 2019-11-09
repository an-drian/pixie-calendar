defmodule PixieCalendar.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema,
      user_id_field: :email,
      password_hash_methods:
        {&Pow.Ecto.Schema.Password.pbkdf2_hash/1,
        &Pow.Ecto.Schema.Password.pbkdf2_verify/2},
      password_min_length: 6,
      password_max_length: 4096

  schema "users" do
    pow_user_fields()

    has_many :gaps, PixieCalendar.Gaps.Gap

    timestamps()
  end
end
