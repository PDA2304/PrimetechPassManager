<!DOCTYPE html>
<html lang="ru">
<head>
<link href="css/app.css" rel="stylesheet">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Авторизация </title>
</head>
<body>
    <div class="container">
        <div class="auth">
            <form action="" method="POST">
            @csrf
            <p>Авторизация </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
            <input type="text" placeholder="Логин" name="login">
            <input type="password" placeholder="Пароль" name="password"> <br>
            <button type="submit"> Войти </button>
            <h3>Вы не зарегистрированы? <a href="{{ url('reg')}}">Регистрация</a></h3>
        </form>
        </div>
    </div>
</body>
</html>
