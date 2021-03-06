% contextconfig2propgrid() - Translate the context_config structure into a class 
% def object for PropertyGrid GUI editing.
%
% Usage:
%  >> properties = contextconfig2propgrid(contextconfig);
%
% Required Inputs:
%   context_config      = context configuration structure created from
%                         pop_context_edit.
%
% Outputs:
%    properties    = properties of class def object to be displayed in
%                    PropertyGrid GUIs
%
% Notes: The context_config structure is only translated into an object at
% the time of being displayed in the PropertyGrid GUI. Once that the GUI is
% closed it is translated back to a structure and is only handled as a
% structure by other functions and the workspace.
%
% See also: pop_runhtb(), pop_context_edit()

%Copyright (C) 2013 BUCANL
%
%Code originally written by James A. Desjardins with contributions from 
%Allan Campopiano and Andrew Lofts, supported by NSERC funding to 
%Sidney J. Segalowitz at the Jack and Nora Walker Canadian Centre for 
%Lifespan Development Research (Brock University), and a Dedicated Programming 
%award from SHARCNet, Compute Ontario.
%
%This program is free software; you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation; either version 2 of the License, or
%(at your option) any later version.
%
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with this program (LICENSE.txt file in the root directory); if not, 
%write to the Free Software Foundation, Inc., 59 Temple Place,
%Suite 330, Boston, MA  02111-1307  USA


function properties = contextconfig2propgrid(contextconfig)

    properties = [ ...
        PropertyGridField('log', contextconfig.log, ...
        'Category', 'Relative locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'log path [log]', ...
        'Description', ['Log directory relative to the project paths ', ...
                        '(e.g. ''analysis/log'', default = ''''). ', ...
                        '[local_project]/[log] will be the location where ', ...
                        'the execution folders containing *.m, *.log and *.err ', ...
                        'files will be created. ', ...
                        'For remote execution [remote_project_work]/[log] will be ',...
                        'the locations where the execution folders will be transfered ', ...
                        'for execution on the remote compute host.']) ...
...
        PropertyGridField('local_project', contextconfig.local_project, ...
        'Category', 'Local locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Project root directory [local_project]', ...
        'Description', ['The absolute path to the project''s root directory. ',...
                        'This is the path from which relative paths in scripts are defined ', ...
                        '(if empty cd is used).']) ...
        PropertyGridField('local_dependency', contextconfig.local_dependency, ...
        'Category', 'Local locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Dependency root directory [local_dependency]', ...
        'Description', 'The absolute path of the root dependency directory containing the program files.') ...
...
        PropertyGridField('remote_user_name', contextconfig.remote_user_name, ...
        'Category', 'Remote locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'User name for the remote system [remote_user_name]', ...
        'Description', ['User name to use whaen accessing the remote system ', ...
                        '(e.g. username).']) ...
        PropertyGridField('remote_exec_host', contextconfig.remote_exec_host, ...
        'Category', 'Remote locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Host of compute execution [remote_exec_host]', ...
        'Description', ['Address to the remote host ', ...
                        '(e.g. username@system.host.com).']) ...
        PropertyGridField('remote_project_archive', contextconfig.remote_project_archive, ...
        'Category', 'Remote locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Project root archive address [remote_project_archive]', ...
        'Description', ['The absolute address to the project''s root directory ', ...
                        'on the remote archive host ', ...
                        '(e.g. username@system.host.com:/archive/username/mystudy).']) ...
        PropertyGridField('remote_project_work', contextconfig.remote_project_work, ...
        'Category', 'Remote locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Project root work address [remote_project_work]', ...
        'Description', ['The absolute address to the project''s root directory ', ...
                        'on the remote compute host ', ...
                        '(e.g. username@system.host.com:/work/username/mystudy).']) ...
        PropertyGridField('remote_dependency', contextconfig.remote_dependency, ...
        'Category', 'Remote locations', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Dependency address [remote_dependency]', ...
        'Description', ['The absolute address of the remote dependency location ', ...
                        'where the program files are found ', ...
                        '(e.g. username@system.host.com:/home/groupename/eeglab/)']) ...
...
        PropertyGridField('mount_archive', contextconfig.mount_archive, ...
        'Category', 'Mount points', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Archive mount directory [mount_archive]', ...
        'Description', ['Local path for mounting the remote_project_archive directory. ', ...
                        'Relative paths are completed from [local_project].']) ...
        PropertyGridField('mount_work', contextconfig.mount_work, ...
        'Category', 'Mount points', ...
        'Type', PropertyType('char', 'row'), ...
        'DisplayName', 'Work mount directory [mount_work]', ...
        'Description', ['Local path for mounting the remote_project_work directory. ', ...
                        'Relative paths are completed from [local_project].']) ...
...
        PropertyGridField('misc', contextconfig.misc, ...
        'Category', 'Miscellaneous locations', ...
        'Type', PropertyType('cellstr', 'column'), ...
        'DisplayName', '[misc]', ...
        'Description', ['Key strings and addresses/paths of other places ',...
                        '(e.g. ''[mount_backup] /media/user/external/backup/'').']) ...
...
        PropertyGridField('system_cmds', contextconfig.system_cmds, ...
        'Category', 'System variables', ...
        'Type', PropertyType('cellstr', 'column'), ...
        'DisplayName', 'system commands', ...
        'Description', 'commands to evaluate from the system...') ...
        ];
