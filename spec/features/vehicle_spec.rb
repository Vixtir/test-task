require "rails_helper"

RSpec.feature "Vehicle managment", type: 'feature' do
  context "root page" do
    it "has a create link" do
      visit root_path
      expect(page).to have_link("Новый")
    end

    context "page for create have a links: " do
      before :each do
        visit root_path
        find_link("Новый").click
      end

      it "create" do
        expect(page).to have_button("Создать Автомобиль")
      end

      it "image downloading" do
        expect(page).to have_link("изображение")
      end

      it "move back" do
        expect(page).to have_link("Назад")
      end
    end

    context "fill the fields in create form" do
      before :each do
        visit new_vehicle_path
      end

      it "valid informations" do
        within("#new_vehicle") do
          fill_in 'Наименование автомобиля', with: 'Jimmy'
          fill_in 'Гос. номер', with: 'A777AA 123'
          fill_in 'Номер ПТС',  with: '16 TB 777777'
        end
        click_on("Создать Автомобиль")
        expect(page).to have_content("Автомобиль успешно создан")
      end

      it "invalid informations" do
        within("#new_vehicle") do
          fill_in 'Наименование автомобиля', with: 'Jimmy'
          fill_in 'Гос. номер', with: 'A777AA'
          fill_in 'Номер ПТС', with: '16 TB 777777'
        end
        click_on("Создать Автомобиль")
        expect(page).to have_content("необхоходимо исправить для сохранения записи")
      end
    end

    context "edit Vehicle" do
      before :each do
        vehicle = create(:vehicle)
        visit root_path
        click_on("Редактировать")
      end

      it "have a edit link" do
        expect(page).to have_button("Сохранить Автомобиль")
      end

      it "editing record" do
        click_button("Сохранить Автомобиль")
        expect(page).to have_content("отредактирован")
      end
    end

    context "delete vehicle" do
      before :each do
        vehicle = create(:vehicle)
        visit root_path
      end

      it "have a delete link" do
        expect(page).to have_link("Удалить")
      end

      it "press delete link" do
        click_on("Удалить")
        expect(page).to have_content("Автомобиль успешно удален")
      end
    end
  end
end
