Luftballon.create!({inscription: "Death From Above", color: "red", gas: "hydrogen", psi: 120, origin: "USA", manufacture_date: "1980-03-14"})
Luftballon.create!({inscription: "Peace in Our Time", color: "violet", gas: "air", psi: 160, origin: "JAP", manufacture_date: "1966-04-17"})
Luftballon.create!({inscription: "Sunny Happy Day", color: "yellow", gas: "helium", psi: 200, origin: "UK", manufacture_date: "1976-06-07"})
Luftballon.create!({inscription: "Melon", color: "green", gas: "helium", origin: "JAP", psi: 140, manufacture_date: "1999-12-06"})
Luftballon.create!({inscription: "Sky High", color: "blue", gas: "helium", origin: "USA", psi: 120, manufacture_date: "1991-04-15"})
Luftballon.create!({inscription: "Fu Manchu", color: "indigo", gas: "helium", origin: "CHN", psi: 220, manufacture_date: "1940-05-24"})
Luftballon.create!({inscription: "Creamsicle", color: "orange", gas: "air", origin: "USA", psi: 150, manufacture_date: "1988-11-04"})
Luftballon.create!({inscription: "Rising Sun", color: "red", gas: "helium", origin: "JAP", psi: 170, manufacture_date: "1981-11-18"})
Luftballon.create!({inscription: "Green Acres", color: "green", gas: "air", origin: "USA", psi: 130, manufacture_date: "1965-03-10"})
Luftballon.create!({inscription: "The English Channel", color: "blue", gas: "air", origin: "UK", psi: 110, manufacture_date: "1980-03-14"})

LuftballonRentalRequest.create!({luftballon_id: 1, start_date: "1990-01-01", end_date: "1995-01-01", status: "APPROVED"})
LuftballonRentalRequest.create!({luftballon_id: 1, start_date: "1996-01-01", end_date: "1998-01-01", status: "APPROVED"})
LuftballonRentalRequest.create!({luftballon_id: 1, start_date: "2000-01-01", end_date: "2005-01-01", status: "APPROVED"})
LuftballonRentalRequest.create!({luftballon_id: 1, start_date: "1998-02-02", end_date: "1999-01-01", status: "PENDING"})
LuftballonRentalRequest.create!({luftballon_id: 1, start_date: "1985-01-01", end_date: "1987-01-01", status: "DENIED"})
LuftballonRentalRequest.create!({luftballon_id: 2, start_date: "1990-01-01", end_date: "1995-01-01"})

