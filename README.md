# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\=
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)


node -v
npm -v
npm i
npm run build
tar -zcvf dist.tar ./build
echo build sucess



version: '3'services:                                      # 集合  docker_jenkins:    user: root                                 # 为了避免一些权限问题 在这我使用了root    restart: always                            # 重启方式    image: jenkins/jenkins:lts                 # 指定服务所使用的镜像 在这里我选择了 LTS (长期支持)    container_name: jenkins                    # 容器名称    ports:                                     # 对外暴露的端口定义      - 8080:8080      - 50000:50000    volumes:                                   # 卷挂载路径      - /home/jenkins/jenkins_home/:/var/jenkins_home  # 这是我们一开始创建的目录挂载到容器内的jenkins_home目录      - /var/run/docker.sock:/var/run/docker.sock      - /usr/bin/docker:/usr/bin/docker                # 这是为了我们可以在容器内使用docker命令      - /usr/local/bin/docker-compose:/usr/local/bin/docker-compose  docker_nginx:    restart: always    image: nginx    container_name: nginx    ports:      - 8090:80      - 80:80      - 433:433    volumes:      - /home/nginx/conf.d/:/etc/nginx/conf.d      - /home/webserver/static/jenkins/dist/:/usr/share/nginx/html
