<!DOCTYPE html>
<html lang="ru">
<head>
<link href="/css/app.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Авторизация </title>
  <style>
    .search {
     width: 300px; /* Ширина поля с кнопкой */
     border: 1px solid #000; /* Параметры рамки */
     min-height: 20px; /* Минимальная высота */
    }
    input[type="search"] {
     border: none; /* Убираем рамку */
     outline: none; /* Убираем свечение в Chrome и Safari */
     -webkit-appearance: none; /* Убираем рамку в Chrome и Safari */
     width: 274px; /* Ширина поля */
     vertical-align: middle; /* Выравнивание по середине */
    }
    input[type="submit"] {
     width: 20px; /* Ширина кнопки */
     height: 20px; /* Высота кнопки */
     border: none; /* Убираем рамку */
     background: url(images/video.png) no-repeat 50% 50%; /* Параметры фона */
    }
   </style>
</head>
<body>
    <div class="container">
        <div class="auth">
            <form action="{{route('addData')}}" method="POST">
            @csrf
            <p>Добавить данные </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>

            @endif

            <input class="place" type="text" placeholder="Название" name="name">
            <input class="place" type="text" id="password-input" placeholder="Логин пользователя" name="login">
            <input class="place" type="password" id="password-input" placeholder="Пароль" name="password">
            <input class="place" type="textbox" id="password-input" placeholder="Описание" name="description">
            <button type="submit"> Добавить данные </button>
        </form>
        </div>
    </div>
</body>
</html>
