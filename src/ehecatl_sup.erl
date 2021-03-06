%% 
%% Copyright (C) 2012, All rights reserved.
%% Jorge Garrido <jorge.garrido@morelosoft.com>
%% ehecatl_sup.erl 
%%

-module(ehecatl_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    Childs = [?CHILD(ehecatl_gen, worker)],
    {ok, { {one_for_one, 1000, 3600}, Childs} }.

