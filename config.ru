require 'social_shares'

run lambda { |env| [200, {'Content-Type'=>'application/json'}, StringIO.new(get_social_shares(env))]}

def get_social_shares(env)
  params = JSON.load(env['rack.input'].gets)
  shares = SocialShares.selected(params['url'], params['networks'])
  JSON.dump(shares)
end
