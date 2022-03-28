<?php
$config = [
    'host' => 'localhost:8889',
    'name' => 'flutter',
    'user' => 'root',
    'password' => 'root',
];

$db = new PDO('mysql:host=' . $config['host'] . ';dbname=' . $config['name'] . '', $config['user'], $config['password']);

if (isset($_POST['first_name']) && isset($_POST['last_name']) && isset($_POST['role']) && isset($_POST['team_name'])
    && isset($_POST['team_size']) && isset($_POST['industry'])
    && isset($_POST['address']) && isset($_POST['house_num']) && isset($_POST['zip_city']) && isset($_POST['city_name']))
{

    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $role = $_POST['role'];
    $team_name = $_POST['team_name'];
    $team_size = $_POST['team_size'];
    $industry = $_POST['industry'];
    $address = $_POST['address'];
    $house = $_POST['house_num'];
    $zip = $_POST['zip_city'];
    $city = $_POST['city_name'];

    $params = [
        'first_name' => $first_name,
        'lastname' => $last_name,
        'role' => $role,
        'team_name' => $team_name,
        'team_size' => $team_size,
        'industry' => $industry,
        'address' => $address,
        'house' => $house,
        'zip' => $zip,
        'city' => $city,
    ];

    $query_2 = "INSERT INTO user (first_name,
                  last_name,
                  role,
                  team_name,
                  team_size,
                  industry,
                  address,
                  house_number,
                  zip,
                  city) VALUES (:first_name,
                                  :lastname,
                                  :role,
                                  :team_name,
                                  :team_size,
                                  :industry,
                                  :address,
                                  :house,
                                  :zip,
                                  :city)";
    $stmt_1 = $db->prepare($query_2);

    $stmt_1->execute($params);

    if ($stmt_1 == true)
    {
        echo json_encode("Success");
    }
} else
{
    return json_encode("Error");
}
