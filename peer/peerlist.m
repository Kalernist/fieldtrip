function list = peerlist

% PEERLIST returns the list of peers and/or displ
%
% -----------------------------------------------------------------------
% Copyright (C) 2010, Robert Oostenveld
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/
% -----------------------------------------------------------------------

list = peer('peerlist');

if nargout==0
  % display the hosts on screen, sort them by the hostid
  [dum, indx] = sort([list.hostid]);
  list = list(indx);
  for i=1:numel(list)
    switch list(i).hoststatus
      case 0
        status = 'zombie';
      case 1
        status = 'slave ';
      case 2
        status = 'master';
      otherwise
        error('unknown status');
    end
    fprintf('%s at %s@%s:%d, group = %s, hostid = %d\n', status, list(i).user, list(i).hostname, list(i).hostport, list(i).group, list(i).hostid);
  end
  clear list
end
