class Emmission < ApplicationRecord
  belongs_to :expense
  has_many :impacts

  def calculator
    [
      {
        carbon: 786.52,
        mcc: 5542,
        category: {
          mainCategory: "Transportation",
          subCategory: "Motorvehicle",
          sector: "Service Stations",
        }
      },
      {
        carbon: 1371.26,
        mcc: 3032,
        category: {
          mainCategory: "Transportation",
          subCategory: "Flights",
          sector: "Airlines"
        }
      },
      {
        carbon: 253.40,
        mcc: 3881,
        category: {
          mainCategory: "Lesure & Entertainment",
          subCategory: "Hotels & Vacation ",
          sector: "Hotels, Motels & Resorts"
        }
      },
      {
        carbon: 238.11,
        mcc: 5818,
        category: {
          mainCategory: "Shopping",
          subCategory: "Department Store",
          sector: "Specialty Retail & Services"
        }
      },
      {
        carbon: 327.41,
        mcc: 5813,
        category: {
          mainCategory: "Food & Beverages",
          subCategory: "Bars & Nightclubs",
          sector: "Bar, Lounge, Disco, Nightclub & Tavern"
        }
      },
      {
        carbon: 451.97,
        mcc: 5814,
        category: {
          mainCategory: "Food & Beverages",
          subCategory: "Restaurants & Fast Food",
          sector: "Fast Food Restaurants"
        }
      },
      {
        carbon: 4132.08,
        mcc: 4900,
        category: {
          mainCategory: "Home & Garden",
          subCategory: "Electric Utilities",
          sector: "Electric Utilities"
        }
      },
      {
        carbon: 141.72,
        mcc: "5697",
        category: {
          mainCategory: "Shopping",
          subCategory: "Clothes & Fashion",
          sector: "Clothing Stores"
        }
      },
      {
        carbon: 2184.80,
        mcc: 5211,
        category: {
          mainCategory: "Home & Garden",
          subCategory: "Hardware & Construction",
          sector: "Hardware Stores & Contractor Services"
        }
      },
      {
        carbon: 317.59,
        mcc: 7631,
        category: {
          mainCategory: "Shopping",
          subCategory: "Electronics",
          sector: "Electronic Sales & Services"
        }
      },
      {
        carbon: 148.14,
        mcc: 8351,
        category: {
          mainCategory: "Government Services",
          subCategory: "Public Services",
          sector: "Government Services"
        }
      },
      {
        carbon: 318.73,
        mcc: 12,
        category: {
          mainCategory: "Food & Beverages",
          subCategory: "Groceries",
          sector: "Grocery Stores & Supermarkets"
        }
      },
      {
        carbon: 317.59,
        mcc: 60,
        category: {
          mainCategory: "Home & Garden",
          subCategory: "Appliances",
          sector: "Household Appliance Stores"
        }
      },
      {
        carbon: 238.11,
        mcc: 5815,
        category: {
          mainCategory: "Shopping",
          subCategory: "Department Store",
          sector: "Specialty Retail & Services"
        }
      }
  ]
  end
end
