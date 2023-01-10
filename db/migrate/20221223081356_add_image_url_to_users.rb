class AddImageUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :image_url, :text, default: "https://img.freepik.com/vecteurs-libre/homme-affaires-caractere-avatar-isole_24877-60111.jpg?w=826&t=st=1671789955~exp=1671790555~hmac=2be52d72a4f8c1203f1611c749bbf8884089b8aa66f9b3c2edf4036cbc456ee7"
  end
end
