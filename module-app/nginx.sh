sudo apt get update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>hello World</h1>" > /var/www/html/index.html