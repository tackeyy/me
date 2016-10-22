Admin.seed(:id,
  { id: 1,
    name: 'admin',
    email: 'admin@example.com',
    crypted_password: Admin.encrypt('password')
  },
)
