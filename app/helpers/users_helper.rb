module UsersHelper
    # Returns the Gravatar for the given user.
    def gravatar_for(user, size: 80)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end

=begin 
All URLs on Gravatar are based on the use of the hashed value of an email address. Images and profiles are both accessed via the hash of an email, and it is considered the primary way of identifying an identity within the system. To ensure a consistent and accurate hash, the following steps should be taken to create a hash:

1. Trim leading and trailing whitespace from an email address
2. Force all characters to lower-case
3. md5 hash the final string
=end 