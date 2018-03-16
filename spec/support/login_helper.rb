def login_as(user=nil)
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in user if user
end
