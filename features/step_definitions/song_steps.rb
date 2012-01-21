Given /^I have song names (.+)$/ do |songs|
  songs.split(",").each do |song|
    Factory :song, name: song.strip
  end
end

Given /^I am on the home page$/ do
  visit pages_home_path
end

When /^I follow "List Songs"$/ do
  visit songs_path
end

Then /^I should see Song (.+)$/ do |songs|
  songs.split(",").each do |song|
    page.should have_content(song)
  end
end