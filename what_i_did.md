When included in a model as above, this one method adds the following functionality:

The ability to save a securely hashed password_digest attribute to the database
A pair of virtual attributes18 (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match
An authenticate method that returns the user when the password is correct (and false otherwise)


using has_secure_password automatically adds an authenticate method to the model(in this case user) that determines whether the returned hash matches the password

returns false if user.authenticate('not right password') and the user if true 