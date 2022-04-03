<!DOCTYPE html>
<html lang="ru">
<head>
    <style>
        .search {
         width: 600px; /* Ширина поля с кнопкой */
         min-height: 20px; /* Минимальная высота */
        }
        input[type="search"] {
         border: none; /* Убираем рамку */
         outline: none; /* Убираем свечение в Chrome и Safari */
         -webkit-appearance: none; /* Убираем рамку в Chrome и Safari */
         width: 274px; /* Ширина поля */
         vertical-align: middle; /* Выравнивание по середине */
        }
        input[type="image"] {
         width: 20px; /* Ширина кнопки */
         height: 20px; /* Высота кнопки */
         border: none; /* Убираем рамку */
         background: url(../copy.png) round; /* Параметры фона */
        }
       </style>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="../../css/app.css" rel="stylesheet">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> Авторизация </title>
</head>
<body>
    <div class="container">
        <div class="auth">
            <form action="{{route('updateUserData', $user->id)}}" method="POST">
            @csrf
            <p> Обновить данные </p>
            @if($errors->any())
            <div>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif
        <input class="place" id="inputText" type="text" value="{{$user->name}}" name="name">
        {{-- <button type='button' id="copyText">Copy</button> --}}
        <input class="place" type="text" value="{{$user->login}}" name="login">
        <input class="place" type="password" value="{{$user->password}}" name="password">
        <input class="place" type="text" value="{{$user->description}}" name="description">
        <a href=''><button type="submit"> Изменить </button> </a>
        </form>
        </div>
    </div>
</body>
<script>
   var text = document.getElementById("inputText");

/* сохраняем кнопку в переменную btn */
var btn = document.getElementById("copyText");

/* вызываем функцию при нажатии на кнопку */
btn.onclick = function() {
  text.select();
  document.execCommand("copy");
}
</script>
</html>
