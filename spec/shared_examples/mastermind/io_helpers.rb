RSpec.shared_examples "MMIOHelpers Game-able" do
  it { is_expected.to respond_to(:initial_instructions) }
  it { is_expected.to respond_to(:winning_prompt) }
  it { is_expected.to respond_to(:no_winner_prompt) }
  it { is_expected.to respond_to(:custom_final_message) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:get_player_1_name) }
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:computer_or_human_guesser_inquiry) }
  it { is_expected.to respond_to(:get_secret_code_from_user) }
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:get_computer_knowledge_level) }
end

RSpec.shared_examples "MMIOHelpers PlayersFactory-able" do
  it { is_expected.to respond_to(:initial_instructions) }
  it { is_expected.to respond_to(:winning_prompt) }
  it { is_expected.to respond_to(:no_winner_prompt) }
  it { is_expected.to respond_to(:custom_final_message) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:get_player_1_name) }
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:computer_or_human_guesser_inquiry) }
  it { is_expected.to respond_to(:get_secret_code_from_user) }
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:get_computer_knowledge_level) }
end

RSpec.shared_examples "MMIOHelpers SecretCodeGenerate-able" do
  it { is_expected.to respond_to(:get_secret_code_from_user) }
end