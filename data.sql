insert into category(name)values("Drama");
insert into category(name)values("Krimi");
insert into author(firstName,lastName)values("Bob","Bobsen");
insert into author(firstName,lastName)values("Knut","Knutsen");
insert into book(title, author_id, category_id)values("At the lake", 1, 1);
insert into book(title, author_id, category_id)values("Death in the forest", 1, 2);
insert into book(title, author_id, category_id)values("It's the end of the world", 2, 2);
insert into book(title, author_id, category_id)values("Spring is cool", 2, 1);

insert into user(login, password)values("a@a.a", "a");
insert into user(login, password)values("b@b.b", "b");

insert into address(city, number, street, zipCode) values("Warsaw", "17", "Grzybowska" , "12345");

insert into customer(firstName, lastName, address_id, user_id) values("Roberta", "Rurka", 1 , 2);
insert into employee(firstName, lastName, user_id) values("Jup", "Hupitup", 1);