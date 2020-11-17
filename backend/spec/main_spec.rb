require 'json'
require_relative '../main'

describe Backend do
  let(:app) { Backend.new }

  context "POST to /passwords" do
    context "password given" do
      let(:response) { post "/passwords", JSON.generate({ password: "" }) }

      it "returns status 200" do
        expect(response.status).to eq 200
        expect(response.body).to be_instance_of(String)
      end
    end

    context "password not given" do
      let(:response) { post "/passwords", JSON.generate({}) }

      it "returns status 400" do
        expect(response.status).to eq 400
      end
    end
  end
end
