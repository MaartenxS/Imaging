function newAppData = createAppData(savedData, appData) 
    newAppData = appData;
%     if ( isfield(appData, 'oldAppData') )
%         newAppData.oldAppData = appData.oldAppData;
%     else
%         newAppData.oldAppData = appData;
%     end

%     newAppData.consts = savedData.consts;
    newAppData.data = savedData.data;
    newAppData.options = savedData.options;
    newAppData.options.doPlot = 1;
    newAppData.save = savedData.save; 
    
    %
    % Create absorption image
    %
    atoms = double(savedData.atoms);
    back = double(savedData.back);
    newAppData.data.dark = double(savedData.dark);

    atoms = atoms - newAppData.data.dark;                                           % subtract the dark background from the atom pic
    atoms2 = atoms .* ( ~(atoms<0));                                                                                % set all pixelvalues<0 to 0
    back =  back - newAppData.data.dark;                                              % subtract the dark background from the background pic
    back2 = back .* ( ~(back<0));                                                                                      % set all pixelvalues<0 to 0
    absorption = log( (back2 + 1)./ (atoms2 + 1)  );
    
    newAppData.data.plots = newAppData.consts.plotTypes.plots;
    newAppData = newAppData.data.plots{newAppData.consts.plotTypes.withAtoms}.setPic(newAppData, atoms);
    newAppData = newAppData.data.plots{newAppData.consts.plotTypes.withoutAtoms}.setPic(newAppData, back);
    newAppData = newAppData.data.plots{newAppData.consts.plotTypes.absorption}.setPic(newAppData, absorption);
%     newAppData = newAppData.data.plots{newAppData.consts.plotTypes.ROI}.setPic(newAppData, absorption);

    %
    % Set Pic data in the figure
    %
    
    % TODO: add option for saved or previos plot settings
    if ~isfield(appData.consts, 'plotSetting')
        appData.options.plotSetting = get(newAppData.ui.pmPlotSetting, 'Value');
        appData.consts.plotSetting.str = {'Default Setting', 'Last Setting'};
        appData.consts.plotSetting.defaults = 1;
        appData.consts.plotSetting.last = 2;
        appData.consts.plotSetting.default = 2;
    end
    switch appData.options.plotSetting
        case appData.consts.plotSetting.defaults % saved settings
            set(newAppData.ui.pmFitType, 'Value', newAppData.data.fitType);
            set(newAppData.ui.pmPlotType, 'Value', newAppData.data.plotType);
            set(newAppData.ui.pmROIUnits, 'Value', newAppData.data.ROIUnits);
            set(newAppData.ui.etROISizeX, 'String', num2str(newAppData.data.ROISizeX));
            set(newAppData.ui.etROISizeY, 'String', num2str(newAppData.data.ROISizeY));
            set(newAppData.ui.etROICenterX, 'String', num2str(newAppData.data.ROICenterX));
            set(newAppData.ui.etROICenterY, 'String', num2str(newAppData.data.ROICenterY));
            
            set(newAppData.ui.pmCalcAtomsNo, 'Value', newAppData.options.calcAtomsNo);
            set(newAppData.ui.etAvgWidth, 'String', num2str(newAppData.options.avgWidth));

%             set(newAppData.ui.etSaveDir, 'String', newAppData.save.saveDir);
            
        case appData.consts.plotSetting.last
            newAppData.data.fitType = get(newAppData.ui.pmFitType, 'Value');
            newAppData.data.plotType = get(newAppData.ui.pmPlotType, 'Value');
            newAppData.data.ROIUnits = get(newAppData.ui.pmROIUnits, 'Value');
            newAppData.data.ROISizeX = str2double(get(newAppData.ui.etROISizeX, 'String'));
            newAppData.data.ROISizeY = str2double(get(newAppData.ui.etROISizeY, 'String'));
            newAppData.data.ROICenterX = str2double(get(newAppData.ui.etROICenterX, 'String'));
            newAppData.data.ROICenterY = str2double(get(newAppData.ui.etROICenterY, 'String'));
            
%     newAppData.data.fitType = appData.data.fitType;
%     newAppData.data.plotType = appData.data.plotType;
%     newAppData.data.ROIUnits = appData.data.ROIUnits;
%     newAppData.data.ROISizeX = appData.data.ROISizeX;
%     newAppData.data.ROISizeY = appData.data.ROISizeY;
%     newAppData.data.ROICenterX = appData.data.ROICenterX;
%     newAppData.data.ROICenterY = appData.data.ROICenterY;

            newAppData.options.calcAtomsNo = get(newAppData.ui.pmCalcAtomsNo, 'Value');
            newAppData.options.avgWidth = str2double(get(newAppData.ui.etAvgWidth, 'String'));
            
            newAppData.data.fits = appData.consts.fitTypes.fits;

            newAppData.save.saveDir = get(newAppData.ui.etSaveDir, 'String');

    end
    tmpPlotType = newAppData.data.plotType;
    newAppData.data.plotType = newAppData.consts.plotTypes.absorption;
    newAppData = newAppData.data.plots{newAppData.consts.plotTypes.ROI}.setPic(newAppData, absorption);
    newAppData.data.plotType = tmpPlotType;
%     newAppData = newAppData.data.plots{newAppData.consts.plotTypes.ROI}.setPic(newAppData, absorption);
    
    set(newAppData.ui.pmCameraType, 'Value', newAppData.options.cameraType);
    set(newAppData.ui.etDetuning, 'String', num2str(newAppData.options.detuning));
    set(newAppData.ui.etAvgWidth, 'String', num2str(newAppData.options.avgWidth));
    newAppData.options.plotSetting = appData.options.plotSetting;
    set(newAppData.ui.pmPlotSetting, 'Value', newAppData.options.plotSetting);

    set(newAppData.ui.etSaveDir, 'String', newAppData.save.saveDir);
    set(newAppData.ui.etComment, 'String', newAppData.save.commentStr(2:end));
    set(newAppData.ui.etPicNo, 'String', num2str(newAppData.save.picNo));
    newAppData.save.isSave = appData.save.isSave;
    set(newAppData.ui.tbSave, 'Value', newAppData.save.isSave);
    set(newAppData.ui.pmSaveParam, 'Value', newAppData.save.saveParam);
    set(newAppData.ui.etParamVal, 'String', num2str(newAppData.save.saveParamVal));

    newAppData.consts.winName = appData.consts.winName;
    set(appData.ui.win, 'Name', [newAppData.consts.winName num2str(newAppData.save.picNo) newAppData.save.commentStr]);
    
    newAppData.consts.runVer = 'offline';
end
