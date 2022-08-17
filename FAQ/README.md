# Questions

[q2](## q2)

## q1

There are three tables, a floor, a room, and a bed. When I connect the bed to the room table (1 to Many), it is expected to add just `room_id` into the bed table, while `room_floor_id` is added by MySQL automatically too. What is happening here?

![](https://s25.picofile.com/file/8452268392/test.png)

```sql
CREATE TABLE IF NOT EXISTS `mydb`.`floor` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
```

```sql
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `floor_id` INT NOT NULL,
  PRIMARY KEY (`id`, `floor_id`),
  INDEX `fk_room_floor_idx` (`floor_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_floor`
    FOREIGN KEY (`floor_id`)
    REFERENCES `mydb`.`floor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
```

```sql
CREATE TABLE IF NOT EXISTS `mydb`.`bed` (
  `id` INT NOT NULL,
  `number` VARCHAR(45) NULL,
  `room_id` INT NOT NULL,
  `room_floor_id` INT NOT NULL,
  PRIMARY KEY (`id`, `room_id`, `room_floor_id`),
  INDEX `fk_bed_room1_idx` (`room_id` ASC, `room_floor_id` ASC) VISIBLE,
  CONSTRAINT `fk_bed_room1`
    FOREIGN KEY (`room_id` , `room_floor_id`)
    REFERENCES `mydb`.`room` (`id` , `floor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
```

## q2

some words here.
