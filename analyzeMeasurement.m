function appData = analyzeMeasurement(appData)
for ( i = 1 : length(appData.analyze.currentAnalyzing) ) %#ok<*NO4LP>
    switch appData.analyze.currentAnalyzing(i)
        case appData.consts.availableAnalyzing.temperature
            %                 [graphs(i) results{i}]  = temperature2(appData.analyze.totAppData);
            temperature(appData.analyze.totAppData);
        case appData.consts.availableAnalyzing.heating
            heating(appData, @tbReadPics_Callback, @lbAvailableAnalyzing_Callback, @pbAnalyze_Callback);
        case appData.consts.availableAnalyzing.gravity
            gravity(appData.analyze.totAppData);
        case appData.consts.availableAnalyzing.lifeTime1
            lifeTime1(appData.analyze.totAppData);
        case appData.consts.availableAnalyzing.lifeTime2
            lifeTime2(appData.analyze.totAppData);
        case appData.consts.availableAnalyzing.dampedSine
            dampedSineY(appData.analyze.totAppData);
        case appData.consts.availableAnalyzing.atomNo
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                N(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.atomsNo; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_atomNo.fig']);
            plot(val, N);
            xlabel('Param Value');
            ylabel('Atoms Number');
        case appData.consts.availableAnalyzing.OD
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                N(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.maxVal; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_OD.fig']);
            plot(val, N);
            xlabel('Param Value');
            ylabel('Max Val');
        case appData.consts.availableAnalyzing.xPos
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                %                     xPos(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.xCenter ...
                %                         * appData.analyze.totAppData{j}.data.camera.xPixSz *1000; %#ok<AGROW>
                xPos(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.xCenter ...
                    * appData.analyze.totAppData{j}.data.camera.xPixSz *1000; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_xPos.fig']);
            plot(val, xPos);
            xlabel('Param Value');
            ylabel('X Position [mm]');
        case appData.consts.availableAnalyzing.yPos
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                %                     if isfield(appData.analyze.totAppData{j}.data.fits{ fitType }, 'y0')
                yPos(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.yCenter ...
                    * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                %                     else
                %                         yPos(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.yCenter ...
                %                             * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                %                     end
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_yPos.fig']);
            plot(val, yPos);
            xlabel('Param Value');
            ylabel('Y Position [mm]');
        case appData.consts.availableAnalyzing.sizeX
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                szX(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.xUnitSize ...
                    * appData.analyze.totAppData{j}.data.camera.xPixSz *1000; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_sizeX.fig']);
            plot(val, szX);
            xlabel('Param Value');
            ylabel('Size X [mm]');
        case appData.consts.availableAnalyzing.sizeY
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                szY(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.yUnitSize ...
                    * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_sizeY.fig']);
            plot(val, szY);
            xlabel('Param Value');
            ylabel('Size Y [mm]');
        case appData.consts.availableAnalyzing.deltaY_2
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                Delta_Y2(j) = 0.5*abs(appData.analyze.totAppData{j}.data.fits{ fitType }.y02-appData.analyze.totAppData{j}.data.fits{ fitType }.y01)...
                    * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
             if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_deltaY.fig']);
            plot(val,  Delta_Y2);
            xlabel('Param Value');
            ylabel('\Deltay/2  [mm]');
        case appData.consts.availableAnalyzing.picMean
            pic = zeros(size(appData.analyze.totAppData{1}.data.plots{1}.pic));
            atoms = zeros(size(appData.analyze.totAppData{1}.data.plots{3}.pic));
            back = zeros(size(appData.analyze.totAppData{1}.data.plots{4}.pic));
            if isempty(pic)
                errordlg('There is no data in the files. Use f when reading the files.','Error', 'modal');
                continue;
            end
            for ( j = 1 : length(appData.analyze.totAppData)  )
                pic = pic + appData.analyze.totAppData{j}.data.plots{1}.pic;
                atoms = atoms + appData.analyze.totAppData{j}.data.plots{3}.pic;
                back = back + appData.analyze.totAppData{j}.data.plots{4}.pic;
            end
            pic = pic / length(appData.analyze.totAppData);
            atoms = atoms / length(appData.analyze.totAppData);
            back = back / length(appData.analyze.totAppData);
            %                  figure;
            %                  colormap(jet(256));
            %                 image( ([x(1) x(end)]+x0-1)*appData.data.camera.xPixSz * 1000, ...
            %                     ([y(1) y(end)]+y0-1-chipStart-1)*appData.data.camera.yPixSz * 1000, pic*256);
            %                 imagesc( pic*256);
            %                  xlabel('px');
            %                  ylabel('px');
            appData = appData.data.plots{appData.consts.plotTypes.absorption}.setPic(appData, [ zeros(appData.data.camera.chipStart-1, size(pic, 2)) ;pic]);
            appData = appData.data.plots{appData.consts.plotTypes.withAtoms}.setPic(appData, atoms);
            appData = appData.data.plots{appData.consts.plotTypes.withoutAtoms}.setPic(appData, back);
            
            %                 appData.data.plots{1}.pic = pic;
            appData.data.fits = appData.consts.fitTypes.fits;
            appData = analyzeAndPlot(appData);
        case appData.consts.availableAnalyzing.SG
            fitType = appData.analyze.totAppData{1}.data.fitType;
            N=[];
            for ( j= 1 : length(appData.analyze.totAppData)  )
                N(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.mF1*100; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 hh = figure('CloseRequestFcn', {@closeRequestFcn_Callback, appData.analyze.readDir, 'SG.fig'});
            %                 plot(val, N, 'o');
            %                 xlabel(xlabelstr{get(appData.ui.pmSaveParam, 'Value')});
            %                 ylabel('mF=1 Percentage [%]');
            %                 saveas(hh, [appData.analyze.readDir '\SG_tmp.fig']);
            %                 plotSG({appData.analyze.readDir})
            plotSG(val, N, appData.analyze.readDir);
        case appData.consts.availableAnalyzing.mF1
            fitType = appData.analyze.totAppData{1}.data.fitType;
            N=[];
            for ( j= 1 : length(appData.analyze.totAppData)  )
                N(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.mF1*100; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_mF1.fig']);
            plot(val,  N, 'o');
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 xlabel(xlabelstr{appData.analyze.totAppData{1}.save.saveParamVal});
            xlabel('Param Value');
            ylabel('mF1 [%] ');
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 hh = figure('CloseRequestFcn', {@closeRequestFcn_Callback, appData.analyze.readDir, 'SG.fig'});
            %                 plot(val, N, 'o');
            %                 xlabel(xlabelstr{get(appData.ui.pmSaveParam, 'Value')});
            %                 ylabel('mF=1 Percentage [%]');
            %                 saveas(hh, [appData.analyze.readDir '\SG_tmp.fig']);
            %                 plotSG({appData.analyze.readDir})
            %                 plotSG(val, N, appData.analyze.readDir);
        case appData.consts.availableAnalyzing.SGyPos
            fitType = appData.analyze.totAppData{1}.data.fitType;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                %                     if isfield(appData.analyze.totAppData{j}.data.fits{ fitType }, 'y0')
                switch fitType
                    case appData.consts.fitTypes.SG
                        yPos1(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.y01 ...
                            * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                        yPos2(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.y02 ...
                            * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                    case appData.consts.fitTypes.twoDGaussian
                        yPos1(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.y0 ...
                            * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                        yPos2(j) = yPos1(j);
                end
                %                     else
                %                         yPos(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.yCenter ...
                %                             * appData.analyze.totAppData{j}.data.camera.yPixSz *1000; %#ok<AGROW>
                %                     end
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            val = val*1e-3;
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            s1 = fitoptions('Method','NonlinearLeastSquares', 'Startpoint', [0.02 1.51 0 70 0]);
            s2 = fitoptions('Method','NonlinearLeastSquares', 'Startpoint', [0.01 2.06 0 100 0]);
            f1 = fittype('a*sin(2*pi*f*(x - p))+c+d*x', 'coefficients', {'a', 'c', 'd', 'f',  'p'}, 'independent', 'x', 'dependent', 'y', 'options', s1);
            f2 = fittype('a*sin(2*pi*f*(x - p))+c+d*x', 'coefficients', {'a', 'c', 'd', 'f',  'p'}, 'independent', 'x', 'dependent', 'y', 'options', s2);
            [out1.res, out1.gof, out1.output] = fit(val', yPos1', f1);
            [out2.res, out2.gof, out2.output] = fit(val', yPos2', f2);
            
            [path, name, ext] = fileparts(appData.analyze.totAppData{1}.save.saveDir);
            export2wsdlg({'mF=1:' 'mF=2:'}, {[name '_mF1'] [name '_mF2']}, {out1 out2});
            
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_mF1.fig']);
            plot(out1.res, 'r', val, yPos1, 'ob');
            title(['mF=1, (' name ')'], 'interpreter', 'none');
            xlabel('time [ms]');
            ylabel('Y Position [mm]');
            legend({['mF=1, (' name ')'],['fit mF=1, (' name ')']},'interpreter', 'none');
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_mF2.fig']);
            plot(out2.res, 'b', val, yPos2, 'or');
            title(['mF=2, (' name ')'], 'interpreter', 'none');
            xlabel('time [ms]');
            ylabel('Y Position [mm]');
            legend({['mF=2, (' name ')'], ['fit mF=2, (' name ')']},'interpreter', 'none');
            
            %                 [path, name, ext] = fileparts(appData.analyze.totAppData{1}.save.saveDir);
            %                 export2wsdlg({'mF=1:' 'mF=2:'}, {[name '_mF1'] [name '_mF2']}, {out1 out2});
            
        case appData.consts.availableAnalyzing.FFT
            fitType = appData.analyze.totAppData{1}.data.fitType;
            w = length(abs(appData.data.fits{fitType}.xData_k));
            data_k = zeros(length(appData.analyze.totAppData), w);
            k = appData.data.fits{fitType}.k;
            for ( j= 1 : length(appData.analyze.totAppData)  )
                data_k(j, :) = appData.data.fits{fitType}.xData_k;
            end
            figure('FileName', [appData.analyze.totAppData{1}.save.saveDir '_fft.fig']);
            plot(k(round(w/2):w), sqrt(sum(abs(data_k(:, round(w/2):w)).^2,1)));
            
            %                 [pic x0 y0] = appData.analyze.totAppData{1}.data.plots{appData.consts.plotTypes.absorption }.getPic();
            %                 [h w] = size(pic);
            %                 data_k = zeros(length(appData.analyze.totAppData), w);
            %                 for ( j= 1 : length(appData.analyze.totAppData)  )
            %                     [xData yData] = ...
            %                         appData.analyze.totAppData{j}.data.plots{appData.consts.plotTypes.absorption }.getXYDataVectors(...
            %                         appData.analyze.totAppData{j}.data.fits{ fitType }.xCenter, appData.analyze.totAppData{j}.data.fits{ fitType }.yCenter, ...
            %                         appData.analyze.totAppData{j}.options.avgWidth);
            %                     [pic x0 y0] = appData.analyze.totAppData{j}.data.plots{appData.consts.plotTypes.absorption }.getPic();
            %                     [h w] = size(pic);
            %                     x = [1 : w];
            %                     y = [1 : h];
            %                     [xFit yFit] = appData.data.fits{appData.data.fitType}.getXYFitVectors(x+x0-1, y+y0-1);
            %                     data = xData-xFit(1, :);
            %                     dx = appData.analyze.totAppData{j}.consts.cameras{appData.analyze.totAppData{j}.options.cameraType}.xPixSz;
            %                     x = dx*[-w/2:w/2-1]; %dx*[-Nx/2:Nx/2-1];
            %                     dk = 2*pi/dx/w; %2*pi/dx/Nx;
            %                     k = dk*[-w/2:w/2-1]; %dk*[-Nx/2:Nx/2-1];
            %                     data_k(j, :)=fftshift(fft(fftshift(data)));
            % %                     figure; plot(k, abs(data_k(j, :)));
            %                 end
            %                 figure('FileName', [appData.analyze.totAppData{1}.save.saveDir '-fft.fig']);
            %                 plot(k, sqrt(sum(abs(data_k).^2,1)));
            
        case appData.consts.availableAnalyzing.oneDstd
            fitType = appData.analyze.totAppData{1}.data.fitType;
            [pic x0 y0] = appData.analyze.totAppData{1}.data.plots{appData.consts.plotTypes.absorption }.getPic();
            [h w] = size(pic);
            data = zeros(length(appData.analyze.totAppData), w);
            fits = zeros(length(appData.analyze.totAppData), w);
            for ( j= 1 : length(appData.analyze.totAppData)  )
                [xData yData] = ...
                    appData.analyze.totAppData{j}.data.plots{appData.consts.plotTypes.absorption }.getXYDataVectors(...
                    appData.analyze.totAppData{j}.data.fits{ fitType }.xCenter, appData.analyze.totAppData{j}.data.fits{ fitType }.yCenter, ...
                    appData.analyze.totAppData{j}.options.avgWidth);
                [pic x0 y0] = appData.analyze.totAppData{j}.data.plots{appData.consts.plotTypes.absorption }.getPic();
                [h w] = size(pic);
                x = [1 : w];
                y = [1 : h];
                [xFit yFit] = appData.analyze.totAppData{j}.data.fits{appData.data.fitType}.getXYFitVectors(x+x0-1, y+y0-1);
                
                data(j, :) = xData;
                fits(j, :) = xFit(1,:);
            end
            figure('FileName', [appData.analyze.totAppData{1}.save.saveDir '_1DSTD_data.fig']);
            imagesc(data);
            title('X Data');
            figure('FileName', [appData.analyze.totAppData{1}.save.saveDir '_1DSTD_its.fig']);
            imagesc(fits);
            title('X Fits');
            export2wsdlg({'Data:', 'Fits:'}, {'data', 'fits'}, {data, fits});
            %                 figure('FileName', [appData.analyze.totAppData{1}.save.saveDir ' - std_1.fig']);
            %                 plot(std(data, 1));
            %                 title('std(data, 1)');
            %                 figure('FileName', [appData.analyze.totAppData{1}.save.saveDir ' - std_2.fig']);
            %                 plot(std(data, 1)./mean(data, 1));
            %                 title('std(data, 1)./mean(data, 1)');
            %                 figure('FileName', [appData.analyze.totAppData{1}.save.saveDir ' - std_3.fig']);
            %                 plot(std(data, 1)./xFit(1, :));
            %                 title('std(data, 1)./xFit(1, :)');
            
        case appData.consts.availableAnalyzing.g2
            [n, g2, dN2] = cloudstat(appData.analyze.totAppData, ...
                appData.analyze.totAppData{1}.data.camera.xPixSz*1e6, ...
                2*appData.analyze.totAppData{1}.options.avgWidth+1, ...
                0, 0); % photonSN,normn);
            figure; 
            plot(mean(n), diag(dN2));
%             figure;
%             imagesc(n);
%             figure;
%             imagesc(g2);
%             figure;
%             imagesc(dN2);
        case appData.consts.availableAnalyzing.lambda
            fitType = appData.analyze.totAppData{1}.data.fitType;
            lambda=[];
            for ( j= 1 : length(appData.analyze.totAppData)  )
                lambda(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.res.lambda* ...
                    appData.analyze.totAppData{j}.consts.cameras{appData.analyze.totAppData{j}.options.cameraType}.yPixSz*1e6; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_lambda.fig']);
            plot(val,  lambda, 'o');
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 xlabel(xlabelstr{appData.analyze.totAppData{1}.save.saveParamVal});
            xlabel('Param Value');
            ylabel('\lambda [\mum] ');
        case appData.consts.availableAnalyzing.phi
            fitType = appData.analyze.totAppData{1}.data.fitType;
            phi=[];
            for ( j= 1 : length(appData.analyze.totAppData)  )
                phi(j) = mod(appData.analyze.totAppData{j}.data.fits{ fitType }.res.phi, 2*pi); %#ok<AGROW>
                OD(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.maxVal;%#ok<AGROW>
                err(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.conf(4) ;%#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_phi.fig']);
            errorbar(val,  phi, err, 'o');
%             figure;
%             errorbar(val, phi, err, 'o');
%             plot( phi, 'o');
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 xlabel(xlabelstr{appData.analyze.totAppData{1}.save.saveParamVal});
            xlabel('Param Value');
            ylabel('phi [rad] ');
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_phi_polar.fig']);
            polar(phi, OD, 'o');
         case appData.consts.availableAnalyzing.visibility
            fitType = appData.analyze.totAppData{1}.data.fitType;
            v=[];
            for ( j= 1 : length(appData.analyze.totAppData)  )
                v(j) = appData.analyze.totAppData{j}.data.fits{ fitType }.res.v; %#ok<AGROW>
                val(j) = appData.analyze.totAppData{j}.save.saveParamVal; %#ok<AGROW>
            end
            if ( min(val) == max(val) )
                for ( j= 1 : length(appData.analyze.totAppData)  )
                    val(j) = appData.analyze.totAppData{j}.save.picNo; %#ok<AGROW>
                end
            end
            figure( 'FileName', [appData.analyze.totAppData{1}.save.saveDir '_visibility.fig']);
            plot(val,  v, 'o');
%             plot(v, 'o');
            %                 xlabelstr =   get(appData.ui.pmSaveParam, 'String');
            %                 xlabel(xlabelstr{appData.analyze.totAppData{1}.save.saveParamVal});
            xlabel('Param Value');
            ylabel('visibility ');
        otherwise
            errordlg({'Not a known Value in \"imaging.m/pbSaveToWorkspace_Callback\".' ['appData.analyze.currentAnalyzing(' num2str(i)  ...
                ') is: ' num2str(appData.data.fitType)]},'Error', 'modal');
    end
end