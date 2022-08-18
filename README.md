## _Functions `client/`_<br/>

```
action()
```
**Info :** Main menu

<br/>

```
createCopy()
```

**Info :** action() → createCopy()

<br/>

```
confirm(plate)
```

**Argument** :<br/>

>  **plate = The vehicle plate**  _(STRING)_

**Info :** action() → createCopy()->confirm(STRING)

<br/>

```
destroyKey()
```

**Info :** action() → destroyKey()

<br/>

```
confirmdestroy(record, plate)
```

**Argument** :<br/>

>  **record = drp_keycopy.record case in .sql file**  _(STRING)_<br/>
>  **plate = The vehicle plate**  _(STRING)_

  

**Info :** action() → destroyKey()->confirmdestroy(INT, STRING)

<br/>

```
destroyAllKey()
```
  

**Info :** action() → destroyAllKey()

<br/><br/>

```
confirmAlldestroy(plate)
```
  
>  **record = drp_keycopy.record case in .sql file**  _(STRING)_<br/>
>  **plate = The vehicle plate**  _(STRING)_

**Info :** action() → destroyAllKey() → confirmAlldestroy(STRING)

<br/>

## _Triggers `server/`_

**There are 5 differents triggers per drug:**

  

```
RegisterNetEvent("Zod#8682::vehListSend")
```

> List of owned vehicles by THE player on your database

<br/>

```
RegisterNetEvent("Zod#8682::makeCashSend")
```

> To remove cash (buy the keymaster)

<br/>

```
RegisterNetEvent("Zod#8682::destroyVeh")
```

> To destroy a key copy

<br/>

```
RegisterNetEvent("Zod#8682::vehCopyListSend")
```

> List of keys copy vehicles of THE player on your database

<br/>

```
RegisterNetEvent("Zod#8682::destroyAllVeh")
```

> To destroy al keys copy

<br/>

## _Credits_

>  **Owner : Zod#8682**  <br/>

>  **Language : French**  <br/>

>  **You can contact me on discord at any time**
