local schema = require("lapis.db.schema")
local types = schema.types
return {
  [1] = function()
    schema.create_table("users", {
      { "id", types.serial {unique = true, primary_key = true }},
      { "name", types.text {unique = true}},
      { "email", types.text {unique = true}},
      { "email_ver_code", types.varchar },
      { "email_verified", types.boolean },
      { "password", types.varchar },
      { "admin", types.boolean },
    })
  end,

  [2] = function()
    schema.create_table("packages", {
      { "id", types.serial {unique = true, primary_key = true}},
      { "name", types.text },
      { "version", types.text },
      { "description", types.text },
      { "game", types.text },
      { "dependencies", types.text },
      { "user_id", types.foreign_key },
      { "url", types.text {unique = true }},
      { "extension", types.text}
    })
  end
}
