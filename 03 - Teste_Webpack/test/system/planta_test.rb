require "application_system_test_case"

class PlantaTest < ApplicationSystemTestCase
  setup do
    @plantum = planta(:one)
  end

  test "visiting the index" do
    visit planta_url
    assert_selector "h1", text: "Planta"
  end

  test "creating a Plantum" do
    visit planta_url
    click_on "New Plantum"

    fill_in "Cor", with: @plantum.cor
    fill_in "Nome", with: @plantum.nome
    fill_in "Valor", with: @plantum.valor
    click_on "Create Plantum"

    assert_text "Plantum was successfully created"
    click_on "Back"
  end

  test "updating a Plantum" do
    visit planta_url
    click_on "Edit", match: :first

    fill_in "Cor", with: @plantum.cor
    fill_in "Nome", with: @plantum.nome
    fill_in "Valor", with: @plantum.valor
    click_on "Update Plantum"

    assert_text "Plantum was successfully updated"
    click_on "Back"
  end

  test "destroying a Plantum" do
    visit planta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plantum was successfully destroyed"
  end
end
