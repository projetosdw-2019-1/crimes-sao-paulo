<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>Heatmap - Consulta 2</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <style>
            h1 {
                font-size: 1.5rem;
                text-align: center;
            }
            /* Always set the map height explicitly to define the size of the div
            * element that contains the map. */
            #map {
            height: 70%;
            width: 70%;
            margin: 0 auto;
            margin-bottom: 15px;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
            height: 100%;
            margin: 0;
            padding: 25px;
            }
            #floating-panel {
            margin:0 auto;
            margin-bottom: 10px; 
            width: 49%;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
            }
        </style>

      <?php include_once 'model/conexao.php'; ?>

    </head>

    <body>

        <div class="row">
            <div class="mx-auto">
                <h1>Crimes de um determinado tipo em zonas urbanas e zonas rurais no estado de São Paulo</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-3 mx-auto">

            <form action="<?php $_SERVER['PHP_SELF']; ?>" method="get" autocomplete="off">
            
                <div class="form-group">
                    <label for="anobo">Ano BO: </label>
                    <select class="form-control" id="anobo" name="anobo" required>
                        <option value="" selected hidden>--Selecione--</option>
                        <option value="2013">2013</option>
                        <option value="2014">2014</option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="tipo">Tipo de Crime: </label>
                    <select class="form-control" id="tipo" name="tipo" required>
                        <option value="" selected hidden>--Selecione--</option>
                        <?php 
                        
                            $sql = "SELECT * FROM TipoRubrica";

                            $stmt = $conn->query($sql);
                            $data = $stmt->fetchAll();

                            foreach ($data as $value) {
                                echo "<option value=".$value['ID_TIPO_RUBRICA'].">".$value['TIPO']."</option>";
                            }

                        ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="zona">Zona: </label>
                    <select class="form-control" id="zona" name="zona" required>
                        <option value="" selected hidden>--Selecione--</option>
                        <?php 
                        
                            $sql = "SELECT * FROM TipoZona";

                            $stmt = $conn->query($sql);
                            $data = $stmt->fetchAll();

                            foreach ($data as $value) {
                                echo "<option value=".$value['ID_TIPO_ZONA'].">".$value['TIPO']."</option>";
                            }

                        ?>
                    </select>
                </div>

                <div class="row text-center justify-content-center mx-auto justify mb-2">
                    <div class="col-6"><a href="index.php" class="btn btn-light">Voltar</a></div>
                    <div class="col-6"><button type="submit" class="btn btn-primary">Visualizar</button></div>
                </div>

            </form>
            
            </div>
        </div>

        <div class="row text-center">
            <div class="col-5 mx-auto">
                <h2 id="total"></h2>
            </div>
        </div>

        <div id="floating-panel">
            <button onclick="toggleHeatmap()">Toggle Heatmap</button>
            <button onclick="changeGradient()">Change gradient</button>
            <button onclick="changeRadius()">Change radius</button>
            <button onclick="changeOpacity()">Change opacity</button>
        </div>
        
        <div id="map"></div>

        <?php
            if(isset($_GET['anobo']) and isset($_GET['tipo']) and isset($_GET['zona'])) {

                $ano = (int)$_GET['anobo'];
                $tipo = (int)$_GET['tipo'];
                $zona = (int)$_GET['zona'];
                $sql = "SELECT  
                        CAST(truncate(L.LATITUDE, 6) AS DECIMAL(17,6)) AS lat,  
                        CAST(truncate(L.LONGITUDE, 6) AS DECIMAL(18,6)) AS lng
                        FROM Ocorrencia O 
                        INNER JOIN Envolvido E 
                        ON O.ID_ENVOLVIDO = E.ID_ENVOLVIDO 
                        INNER JOIN TipoRubrica TR
                        ON O.ID_TIPO_RUBRICA = TR.ID_TIPO_RUBRICA 
                        INNER JOIN Localizacao L 
                        ON O.ID_LOCALIZACAO = L.ID_LOCALIZACAO 
                        INNER JOIN Municipio M 
                        ON M.ID_MUNICIPIO = L.ID_MUNICIPIO
                        INNER JOIN TipoZona TZ 
                        ON M.ID_TIPO_ZONA = TZ.ID_TIPO_ZONA
                        WHERE O.ANO_BO = $ano 
                        AND TZ.ID_TIPO_ZONA = $zona 
                        AND TR.ID_TIPO_RUBRICA = $tipo 
                        AND L.LATITUDE is not null 
                        AND L.LONGITUDE is not null;";

                $stmt = $conn->query($sql);
                $data = $stmt->fetchAll();
                $total_crimes = count($data);
                
                #var_dump($data);

            }

        ?>
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>

        // This example requires the Visualization library. Include the libraries=visualization
        // parameter when you first load the API. For example:
        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=visualization">

        var map, heatmap;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
            zoom: 7,
            center: {lat: -23.5505199, lng: -46.6333094},
            mapTypeId: 'roadmap'
            });

            heatmap = new google.maps.visualization.HeatmapLayer({
            data: getPoints(),
            map: map
            });
        }

        function toggleHeatmap() {
            heatmap.setMap(heatmap.getMap() ? null : map);
        }

        function changeGradient() {
            var gradient = [
            'rgba(0, 255, 255, 0)',
            'rgba(0, 255, 255, 1)',
            'rgba(0, 191, 255, 1)',
            'rgba(0, 127, 255, 1)',
            'rgba(0, 63, 255, 1)',
            'rgba(0, 0, 255, 1)',
            'rgba(0, 0, 223, 1)',
            'rgba(0, 0, 191, 1)',
            'rgba(0, 0, 159, 1)',
            'rgba(0, 0, 127, 1)',
            'rgba(63, 0, 91, 1)',
            'rgba(127, 0, 63, 1)',
            'rgba(191, 0, 31, 1)',
            'rgba(255, 0, 0, 1)'
            ]
            heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
        }

        function changeRadius() {
            heatmap.set('radius', heatmap.get('radius') ? null : 20);
        }

        function changeOpacity() {
            heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
        }

        // Heatmap data: 500 Points
        function getPoints() {
            return [
            <?php
                if($data){
                    foreach ($data as $coor){?>
                    new google.maps.LatLng(<?=(float)$coor["lat"];?>, <?=(float)$coor["lng"];?>),
                <?php }}?>
                    new google.maps.LatLng(37.751266, -122.403355)
            ];
        }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=SUA_CHAVE_DA_API_AQUI&libraries=visualization&callback=initMap">
        </script>
        <script>
            var h2 = document.getElementById("total");
            h2.innerHTML = "O total destes crimes é: " + <?php echo $total_crimes; ?>
        </script>
    </body>
</html>