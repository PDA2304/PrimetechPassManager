
<!doctype html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Администратор</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Вывод данных</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      body {
    font-family: Courier New;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
    color: #292b2c;
    background-color: #fff;
}

    </style>
  </head>
  <body>

<header>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark" >
    <div class="container">
      <a class="navbar-brand" href="#">Добро пожаловать, {{ $user->login }}</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" style="padding-left: 2em" href="{{route('indexBin')}}">Корзина</a>
          </li>
        </ul>
        <form class="d-flex">
            <a href="{{route('logout')}}"> <button type="button" class="btn btn-secondary">Выход</button> </a>
        </form>
      </div>
    </div>
  </nav>

</header>
<p> </p>
<div class="container">
  {{-- <h2>Пользователь</h2>  <br> --}}
  <a href="{{route('createData')}}"><button type="button" class="btn btn-outline-primary">Добавить</button> </a><p> </p>
  <div class="table-responsive">
  <table class="table ">
    <thead>
        <tr>
          <th>Ресурс</th>
          <th>Описание</th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody id="myTable">
      @foreach ($data as $elem)
        <tr>
          <td> {{$elem->name}} </td>
          <td colspan="5" class="col-4"> {{$elem->description}} </td>
          <td><a href="{{route('deleteUserData', $elem->id)}}"><button>Удалить</button></a> </td>
          <td><a href="{{route('update', $elem->id)}}"><button>Редактировать</button></a> </td>
        </tr>
      @endforeach
    </tbody>
    </table>
  </div>
</div>
</body>
</html>
