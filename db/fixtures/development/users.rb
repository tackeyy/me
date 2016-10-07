User.seed(:id,
  { id: 1,
    name: 'user',
    email: 'user@example.com',
    crypted_password: User.encrypt('password')
  },
)
