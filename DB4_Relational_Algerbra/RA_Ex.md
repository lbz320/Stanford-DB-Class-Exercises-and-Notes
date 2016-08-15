## Relation Algebra Exercise

### Q1
Find all pizzas eaten by at least one female over the age of 20.

**Answer:**
```
\project_{pizza}(
    \select_{gender='female' and age>20} (
        Person \join Eats
    )
);
```

### Q2
Find the names of all females who eat at least one pizza served by Straw Hat. (Note: The pizza need not be eaten at Straw Hat.)

**Answer:**
```
\project_{name}(
    \select_{pizzeria = 'Straw Hat' and gender = 'female'} (
        Person \join Eats \join Serves
    )
);
```

### Q3
Find all pizzerias that serve at least one pizza for less than $10 that either Amy or Fay (or both) eat.

**Answer:**
```
\project_{pizzeria}(
    \select_{(name = 'Amy' or name = 'Fay') and price < 10 }(
    Eats \join Serves
    )
);
```

### Q4
Find all pizzerias that serve at least one pizza for less than $10 that both Amy and Fay eat.

**Answer:**
```
\project_{pizzeria}(
\select_{(name1 = 'Amy' and name2 = 'Fay') or (name1= 'Fay' and name2 = 'Amy')}(
\rename_{pizzeria, name1}(
    \project_{pizzeria, name}(
        \select_{(name = 'Amy' or name = 'Fay') and price < 10 }(
            Eats \join Serves
    ))
    )
 \join
 \rename_{pizzeria, name2}(
    \project_{pizzeria, name}(
        \select_{(name = 'Amy' or name = 'Fay') and price < 10 }(
            Eats \join Serves
    ))
    )
))
;
```

### Q5
Find the names of all people who eat at least one pizza served by Dominos but who do not frequent Dominos.

**Answer:**
```
(\project_{name}(
        \select_{pizzeria = 'Dominos'}(
            Eats \join Serves)))
\diff
(\project_{name}(
    \select_{pizzeria = 'Dominos'} Frequents
))
;
```

### Q6
Find all pizzas that are eaten only by people younger than 24, or that cost less than $10 everywhere they're served.

**Answer:**
```
(\project_{pizza} eats
\diff
\project_{pizza}(
  \select_{age >= 24}
    person \join eats))
\union (
  (\project_{pizza}
    \select_{price <= 10} serves) // pizzas price less than 10
  \diff
  (\project_{pizza}
    \select_{price > 10} serves)) // pizzas price larger than 10
;

```

### Q7
Find the age of the oldest person (or people) who eat mushroom pizza.

**Answer:**
```
(\project_{age}
    (\select_{pizza='mushroom'}(Person \join Eats)))
\diff
(\project_{age}(\select_{age<age2}
(
\project_{name, age}(
    \select_{pizza='mushroom'}
        (Person \join Eats)
                    )
\join_{name <> name2}
\project_{name2, age2}(
    \rename_{name2, age2}
        (\project_{name, age}
            (\select_{pizza='mushroom'}(Person \join Eats))
        )
                      )
)
));

```

### Q8
Find all pizzerias that serve only pizzas eaten by people over 30.

**Answer:**
```
(\project_{pizzeria}(
    (\project_{pizza} (
        \select_{age > 30}
            Person \join Eats))
    \join
    Serves))
\diff
\project_{pizzeria}
(
(\project_{pizzeria, pizza}
Serves
\diff
(\project_{pizzeria, pizza}(
    (\project_{pizza} (
        \select_{age > 30}
            Person \join Eats))
    \join
    Serves)
)));

```

### Q9
Find all pizzerias that serve every pizza eaten by people over 30.  

**Answer:**
```
\project_{pizzeria}
(
\project_{pizzeria, pizza}
(
\project_{pizza} (
    \select_{age > 30}
        Person \join Eats)
        \join
        Serves
        )
\join_{pizza <> pizza2 and pizzeria1 = pizzeria }

\project_{pizzeria1, pizza2}
(\rename_{pizzeria1, pizza2}(
    \project_{pizzeria, pizza}
(
\project_{pizza} (
    \select_{age > 30}
        Person \join Eats)
        \join
        Serves
        )))
);
```
