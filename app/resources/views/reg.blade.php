<!DOCTYPE html>
<html lang="ru">
<head>
<link href="css/app.css" rel="stylesheet">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Регистраиця </title>
</head>
<body>
    <header>

    </header>
    <div class="container">
        <div class="auth">

        <form action="" method="POST">
            @csrf
            <p>Регистраиця</p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <input type="text" placeholder="Имя" name="user_name">
            <input type="text" placeholder="Логин или почта" name="login">
            <input type="password" placeholder="Пароль" name="password"> <br>
            <button type="submit"> Зарегистрироваться </button>
            <h3>Уже зарегистрированы? <a href="{{ url('/')}}">Войти</a></h3>
        </form>
        </div>
    </div>
</body>
</html>
